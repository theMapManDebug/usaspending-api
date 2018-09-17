import logging
import os.path

from django.conf import settings
from django.core.management.base import BaseCommand
from openpyxl import load_workbook
import re

from usaspending_api.references.models import NAICS


class Command(BaseCommand):
    help = "Updates DB from Excel spreadsheets of USAspending terminology definitions into the naics model"

    logger = logging.getLogger('console')

    path = 'usaspending_api/data/naics_archive'
    path = os.path.normpath(path)
    default_path = os.path.join(settings.BASE_DIR, path)

    def add_arguments(self, parser):
        parser.add_argument('-p', '--path', help='the path to the Excel spreadsheet to load', default=self.default_path)
        parser.add_argument('-a', '--append', help='Append to existing guide', action='store_true', default=False)

    def handle(self, *args, **options):

        load_NAICS(path=options['path'], append=options['append'])


def load_NAICS(path, append):

    if append:
        logging.info('Appending definitions to existing guide')
    else:
        logging.info('Deleting existing definitions from guide')
        NAICS.objects.all().delete()

    # year regex object precompile
    p_year = re.compile("(20[0-9]{2})")

    dir_files = []

    for fname in os.listdir(path):
        if fname.find("naics") > 0:
            dir_files.append(os.path.join(path, fname))

    for path in dir_files:

        naics_year = p_year.search(path).group()
        wb = load_workbook(filename=path)
        ws = wb.active
        rows = ws.rows

        current_row = 0
        for row in rows:
            if current_row == 0:
                current_row += 1
                continue
            if not row[0].value:
                break  # Reads file only until a line with blank `term`

            naics_code = row[0].value
            naics_desc = row[1].value

            obj, created = NAICS.objects.get_or_create(pk=naics_code)

            print(obj.year, created)
            if not created:
                if int(naics_year) > int(obj.year):
                    NAICS.objects.filter(pk=naics_code).update(description=naics_desc, year=naics_year)
            else:
                obj.description = naics_desc
                obj.year = naics_year
                obj.save()

            current_row += 1
