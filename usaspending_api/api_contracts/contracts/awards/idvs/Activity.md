FORMAT: 1A
HOST: https://api.usaspending.gov

# IDV Activity [/api/v2/awards/idvs/activity/]

This endpoint is used to power the IDV (Indefinite Delivery Vehicle) Activity visualization on IDV Summary Pages. It returns information about child awards and grandchild awards for a given IDV.

## POST

+ Request (application/json)
    + Attributes (object)
        + `award_id`: `CONT_IDV_V509P6176_3600` (required, string)
            Either a "generated" natural award id (string) or a database surrogate award id (number).  Generated award identifiers are preferred as they are effectively permanent.  Surrogate award ids are retained for backward compatibility but are deprecated.
        + `limit` (optional, number)
            The number of results to include per page.
            + Default: 10
        + `page` (optional, number)
            The page of results to return based on the limit.
            + Default: 1

+ Response 200 (application/json)
    + Attributes
        + `results` (required, array[ChildAward], fixed-type)
            Results are sorted by awarded amount in descending order.
        + `page_metadata` (required, PageMetaData)

    * Body

            {
                "results": [
                    {
                        "award_id": 1867804,
                        "awarding_agency": "Department of Veterans Affairs",
                        "awarding_agency_id": 561,
                        "generated_unique_award_id": "CONT_AWD_00509200110C509C25044V509P6176_3600_V509P6176_3600",
                        "last_date_to_order": "2003-09-15 00:00:00",
                        "parent_award_id": 69001298,
                        "parent_award_piid": "V509P6176",
                        "obligated_amount": 30000.0,
                        "awarded_amount": 0.0,
                        "period_of_performance_start_date": "2001-10-15",
                        "piid": "00509200110C509C25044V509P6176",
                        "recipient_name": "SIEMENS MEDICAL SOLUTIONS USA INCORPORATED",
                        "recipient_id": "b5e31cf9-1f2f-dee0-7f70-eb73fd55617a-C",
                        "grandchild": false
                    },
                    {
                        "award_id": 1867504,
                        "awarding_agency": "Department of Veterans Affairs",
                        "awarding_agency_id": 561,
                        "generated_unique_award_id": "CONT_AWD_00509200010C509C15099V509P6176_3600_V509P6176_3600",
                        "last_date_to_order": "2003-09-15 00:00:00",
                        "parent_award_id": 69001298,
                        "parent_award_piid": "V509P6176",
                        "obligated_amount": 30000.0,
                        "awarded_amount": 0.0,
                        "period_of_performance_start_date": "2000-10-15",
                        "piid": "00509200010C509C15099V509P6176",
                        "recipient_name": "SIEMENS MEDICAL SOLUTIONS USA INCORPORATED",
                        "recipient_id": "b5e31cf9-1f2f-dee0-7f70-eb73fd55617a-C",
                        "grandchild": false
                    },
                    {
                        "award_id": 1867181,
                        "awarding_agency": "Department of Veterans Affairs",
                        "awarding_agency_id": 561,
                        "generated_unique_award_id": "CONT_AWD_00509199910C509C05018V509P6176_3600_V509P6176_3600",
                        "last_date_to_order": "2003-09-15 00:00:00",
                        "parent_award_id": 69001298,
                        "parent_award_piid": "V509P6176",
                        "obligated_amount": 30000.0,
                        "awarded_amount": 0.0,
                        "period_of_performance_start_date": "1999-10-15",
                        "piid": "00509199910C509C05018V509P6176",
                        "recipient_name": "SIEMENS MEDICAL SOLUTIONS USA INCORPORATED",
                        "recipient_id": "b5e31cf9-1f2f-dee0-7f70-eb73fd55617a-C",
                        "grandchild": false
                    }
                ],
                "page_metadata": {
                    "hasNext": false,
                    "hasPrevious": false,
                    "limit": 10,
                    "next": null,
                    "page": 1,
                    "previous": null,
                    "total": 3
                }
            }


# Data Structures

## PageMetaData (object)
+ `hasNext` (boolean, required)
+ `hasPrevious` (boolean, required)
+ `limit` (required, number)
+ `next` (number, required, nullable)
+ `page` (number, required)
+ `previous` (number, required, nullable)
+ `total` (required, number)
    Total count of all results including those not returned on this page.

## ChildAward (object)
+ `award_id` (required, number)
    Unique internal surrogate identifier for an award.  Deprecated.  Use `generated_unique_award_id`.
+ `generated_unique_award_id` (required, string)
    Unique internal natural identifier for an award.
+ `awarding_agency` (required, string)
+ `awarding_agency_id` (required, number)
+ `last_date_to_order` (required, string, nullable)
+ `parent_award_id` (required, number, nullable)
    Internal, surrogate id for an award.
+ `parent_award_piid` (required, string, nullable)
+ `obligated_amount` (required, number)
+ `awarded_amount` (required, number)
+ `period_of_performance_start_date` (required, string, nullable)
    The starting date of the award in the format `YYYY-MM-DD`
+ `piid` (required, string)
    Procurement Instrument Identifier (PIID).
+ `recipient_name` (required, string, nullable)
+ `recipient_id` (required, string, nullable)
+ `grandchild` (required, boolean)