DROP TABLE IF EXISTS transaction_fpds_new;

CREATE TABLE transaction_fpds_new AS
(

    SELECT
        NULL::bigint as transaction_id,
        *
    FROM
        dblink ('broker_server', '(
            SELECT
                detached_award_procurement_id,
                detached_award_proc_unique,
                piid,
                agency_id,
                awarding_sub_tier_agency_c,
                awarding_sub_tier_agency_n,
                awarding_agency_code,
                awarding_agency_name,
                parent_award_id,
                award_modification_amendme,
                type_of_contract_pricing,
                type_of_contract_pric_desc,
                contract_award_type,
                contract_award_type_desc,
                naics,
                naics_description,
                awardee_or_recipient_uniqu,
                ultimate_parent_legal_enti,
                ultimate_parent_unique_ide,
                award_description,
                place_of_performance_zip4a,
                place_of_performance_zip5,
                place_of_perform_zip_last4,
                place_of_perform_city_name,
                place_of_perform_county_co,
                place_of_perform_county_na,
                place_of_performance_congr,
                awardee_or_recipient_legal,
                legal_entity_city_name,
                legal_entity_county_code,
                legal_entity_county_name,
                legal_entity_state_code,
                legal_entity_state_descrip,
                legal_entity_zip4,
                legal_entity_zip5,
                legal_entity_zip_last4,
                legal_entity_congressional,
                legal_entity_address_line1,
                legal_entity_address_line2,
                legal_entity_address_line3,
                legal_entity_country_code,
                legal_entity_country_name,
                period_of_performance_star,
                period_of_performance_curr,
                period_of_perf_potential_e,
                ordering_period_end_date,
                action_date,
                action_type,
                action_type_description,
                federal_action_obligation,
                current_total_value_award,
                potential_total_value_awar,
                total_obligated_amount,
                base_exercised_options_val,
                base_and_all_options_value,
                funding_sub_tier_agency_co,
                funding_sub_tier_agency_na,
                funding_office_code,
                funding_office_name,
                awarding_office_code,
                awarding_office_name,
                referenced_idv_agency_iden,
                referenced_idv_agency_desc,
                funding_agency_code,
                funding_agency_name,
                place_of_performance_locat,
                place_of_performance_state,
                place_of_perfor_state_desc,
                place_of_perform_country_c,
                place_of_perf_country_desc,
                idv_type,
                idv_type_description,
                referenced_idv_type,
                referenced_idv_type_desc,
                vendor_doing_as_business_n,
                vendor_phone_number,
                vendor_fax_number,
                multiple_or_single_award_i,
                multiple_or_single_aw_desc,
                referenced_mult_or_single,
                referenced_mult_or_si_desc,
                type_of_idc,
                type_of_idc_description,
                a_76_fair_act_action,
                a_76_fair_act_action_desc,
                dod_claimant_program_code,
                dod_claimant_prog_cod_desc,
                clinger_cohen_act_planning,
                clinger_cohen_act_pla_desc,
                commercial_item_acquisitio,
                commercial_item_acqui_desc,
                commercial_item_test_progr,
                commercial_item_test_desc,
                consolidated_contract,
                consolidated_contract_desc,
                contingency_humanitarian_o,
                contingency_humanitar_desc,
                contract_bundling,
                contract_bundling_descrip,
                contract_financing,
                contract_financing_descrip,
                contracting_officers_deter,
                contracting_officers_desc,
                cost_accounting_standards,
                cost_accounting_stand_desc,
                cost_or_pricing_data,
                cost_or_pricing_data_desc,
                country_of_product_or_serv,
                country_of_product_or_desc,
                davis_bacon_act,
                davis_bacon_act_descrip,
                evaluated_preference,
                evaluated_preference_desc,
                extent_competed,
                extent_compete_description,
                fed_biz_opps,
                fed_biz_opps_description,
                foreign_funding,
                foreign_funding_desc,
                government_furnished_equip,
                government_furnished_desc,
                information_technology_com,
                information_technolog_desc,
                interagency_contracting_au,
                interagency_contract_desc,
                local_area_set_aside,
                local_area_set_aside_desc,
                major_program,
                purchase_card_as_payment_m,
                purchase_card_as_paym_desc,
                multi_year_contract,
                multi_year_contract_desc,
                national_interest_action,
                national_interest_desc,
                number_of_actions,
                number_of_offers_received,
                other_statutory_authority,
                performance_based_service,
                performance_based_se_desc,
                place_of_manufacture,
                place_of_manufacture_desc,
                price_evaluation_adjustmen,
                product_or_service_code,
                product_or_service_co_desc,
                program_acronym,
                other_than_full_and_open_c,
                other_than_full_and_o_desc,
                recovered_materials_sustai,
                recovered_materials_s_desc,
                research,
                research_description,
                sea_transportation,
                sea_transportation_desc,
                service_contract_act,
                service_contract_act_desc,
                small_business_competitive,
                solicitation_identifier,
                solicitation_procedures,
                solicitation_procedur_desc,
                fair_opportunity_limited_s,
                fair_opportunity_limi_desc,
                subcontracting_plan,
                subcontracting_plan_desc,
                program_system_or_equipmen,
                program_system_or_equ_desc,
                type_set_aside,
                type_set_aside_description,
                epa_designated_product,
                epa_designated_produc_desc,
                walsh_healey_act,
                walsh_healey_act_descrip,
                transaction_number,
                sam_exception,
                sam_exception_description,
                city_local_government,
                county_local_government,
                inter_municipal_local_gove,
                local_government_owned,
                municipality_local_governm,
                school_district_local_gove,
                township_local_government,
                us_state_government,
                us_federal_government,
                federal_agency,
                federally_funded_research,
                us_tribal_government,
                foreign_government,
                community_developed_corpor,
                labor_surplus_area_firm,
                corporate_entity_not_tax_e,
                corporate_entity_tax_exemp,
                partnership_or_limited_lia,
                sole_proprietorship,
                small_agricultural_coopera,
                international_organization,
                us_government_entity,
                emerging_small_business,
                c8a_program_participant,
                sba_certified_8_a_joint_ve,
                dot_certified_disadvantage,
                self_certified_small_disad,
                historically_underutilized,
                small_disadvantaged_busine,
                the_ability_one_program,
                historically_black_college,
                c1862_land_grant_college,
                c1890_land_grant_college,
                c1994_land_grant_college,
                minority_institution,
                private_university_or_coll,
                school_of_forestry,
                state_controlled_instituti,
                tribal_college,
                veterinary_college,
                educational_institution,
                alaskan_native_servicing_i,
                community_development_corp,
                native_hawaiian_servicing,
                domestic_shelter,
                manufacturer_of_goods,
                hospital_flag,
                veterinary_hospital,
                hispanic_servicing_institu,
                foundation,
                woman_owned_business,
                minority_owned_business,
                women_owned_small_business,
                economically_disadvantaged,
                joint_venture_women_owned,
                joint_venture_economically,
                veteran_owned_business,
                service_disabled_veteran_o,
                contracts,
                grants,
                receives_contracts_and_gra,
                airport_authority,
                council_of_governments,
                housing_authorities_public,
                interstate_entity,
                planning_commission,
                port_authority,
                transit_authority,
                subchapter_s_corporation,
                limited_liability_corporat,
                foreign_owned_and_located,
                american_indian_owned_busi,
                alaskan_native_owned_corpo,
                indian_tribe_federally_rec,
                native_hawaiian_owned_busi,
                tribally_owned_business,
                asian_pacific_american_own,
                black_american_owned_busin,
                hispanic_american_owned_bu,
                native_american_owned_busi,
                subcontinent_asian_asian_i,
                other_minority_owned_busin,
                for_profit_organization,
                nonprofit_organization,
                other_not_for_profit_organ,
                us_local_government,
                referenced_idv_modificatio,
                undefinitized_action,
                undefinitized_action_desc,
                domestic_or_foreign_entity,
                domestic_or_foreign_e_desc,
                annual_revenue,
                division_name,
                division_number_or_office,
                number_of_employees,
                vendor_alternate_name,
                vendor_alternate_site_code,
                vendor_enabled,
                vendor_legal_org_name,
                vendor_location_disabled_f,
                vendor_site_code,
                pulled_from,
                last_modified,
                initial_report_date,
                referenced_idv_agency_name,
                referenced_multi_or_single,
                award_or_idv_flag,
                place_of_perform_country_n,
                place_of_perform_state_nam
            FROM detached_award_procurement
        )') AS transaction_contracts
    (
        detached_award_procurement_id int,
        detached_award_proc_unique text,
        piid text,
        agency_id text,
        awarding_sub_tier_agency_c text,
        awarding_sub_tier_agency_n text,
        awarding_agency_code text,
        awarding_agency_name text,
        parent_award_id text,
        award_modification_amendme text,
        type_of_contract_pricing text,
        type_of_contract_pric_desc text,
        contract_award_type text,
        contract_award_type_desc text,
        naics text,
        naics_description text,
        awardee_or_recipient_uniqu text,
        ultimate_parent_legal_enti text,
        ultimate_parent_unique_ide text,
        award_description text,
        place_of_performance_zip4a text,
        place_of_performance_zip5 text,
        place_of_perform_zip_last4 text,
        place_of_perform_city_name text,
        place_of_perform_county_co text,
        place_of_perform_county_na text,
        place_of_performance_congr text,
        awardee_or_recipient_legal text,
        legal_entity_city_name text,
        legal_entity_county_code text,
        legal_entity_county_name text,
        legal_entity_state_code text,
        legal_entity_state_descrip text,
        legal_entity_zip4 text,
        legal_entity_zip5 text,
        legal_entity_zip_last4 text,
        legal_entity_congressional text,
        legal_entity_address_line1 text,
        legal_entity_address_line2 text,
        legal_entity_address_line3 text,
        legal_entity_country_code text,
        legal_entity_country_name text,
        period_of_performance_star text,
        period_of_performance_curr text,
        period_of_perf_potential_e text,
        ordering_period_end_date text,
        action_date text,
        action_type text,
        action_type_description text,
        federal_action_obligation numeric,
        current_total_value_award text,
        potential_total_value_awar text,
        total_obligated_amount text,
        base_exercised_options_val text,
        base_and_all_options_value text,
        funding_sub_tier_agency_co text,
        funding_sub_tier_agency_na text,
        funding_office_code text,
        funding_office_name text,
        awarding_office_code text,
        awarding_office_name text,
        referenced_idv_agency_iden text,
        referenced_idv_agency_desc text,
        funding_agency_code text,
        funding_agency_name text,
        place_of_performance_locat text,
        place_of_performance_state text,
        place_of_perfor_state_desc text,
        place_of_perform_country_c text,
        place_of_perf_country_desc text,
        idv_type text,
        idv_type_description text,
        referenced_idv_type text,
        referenced_idv_type_desc text,
        vendor_doing_as_business_n text,
        vendor_phone_number text,
        vendor_fax_number text,
        multiple_or_single_award_i text,
        multiple_or_single_aw_desc text,
        referenced_mult_or_single text,
        referenced_mult_or_si_desc text,
        type_of_idc text,
        type_of_idc_description text,
        a_76_fair_act_action text,
        a_76_fair_act_action_desc text,
        dod_claimant_program_code text,
        dod_claimant_prog_cod_desc text,
        clinger_cohen_act_planning text,
        clinger_cohen_act_pla_desc text,
        commercial_item_acquisitio text,
        commercial_item_acqui_desc text,
        commercial_item_test_progr text,
        commercial_item_test_desc text,
        consolidated_contract text,
        consolidated_contract_desc text,
        contingency_humanitarian_o text,
        contingency_humanitar_desc text,
        contract_bundling text,
        contract_bundling_descrip text,
        contract_financing text,
        contract_financing_descrip text,
        contracting_officers_deter text,
        contracting_officers_desc text,
        cost_accounting_standards text,
        cost_accounting_stand_desc text,
        cost_or_pricing_data text,
        cost_or_pricing_data_desc text,
        country_of_product_or_serv text,
        country_of_product_or_desc text,
        davis_bacon_act text,
        davis_bacon_act_descrip text,
        evaluated_preference text,
        evaluated_preference_desc text,
        extent_competed text,
        extent_compete_description text,
        fed_biz_opps text,
        fed_biz_opps_description text,
        foreign_funding text,
        foreign_funding_desc text,
        government_furnished_equip text,
        government_furnished_desc text,
        information_technology_com text,
        information_technolog_desc text,
        interagency_contracting_au text,
        interagency_contract_desc text,
        local_area_set_aside text,
        local_area_set_aside_desc text,
        major_program text,
        purchase_card_as_payment_m text,
        purchase_card_as_paym_desc text,
        multi_year_contract text,
        multi_year_contract_desc text,
        national_interest_action text,
        national_interest_desc text,
        number_of_actions text,
        number_of_offers_received text,
        other_statutory_authority text,
        performance_based_service text,
        performance_based_se_desc text,
        place_of_manufacture text,
        place_of_manufacture_desc text,
        price_evaluation_adjustmen text,
        product_or_service_code text,
        product_or_service_co_desc text,
        program_acronym text,
        other_than_full_and_open_c text,
        other_than_full_and_o_desc text,
        recovered_materials_sustai text,
        recovered_materials_s_desc text,
        research text,
        research_description text,
        sea_transportation text,
        sea_transportation_desc text,
        service_contract_act text,
        service_contract_act_desc text,
        small_business_competitive text,
        solicitation_identifier text,
        solicitation_procedures text,
        solicitation_procedur_desc text,
        fair_opportunity_limited_s text,
        fair_opportunity_limi_desc text,
        subcontracting_plan text,
        subcontracting_plan_desc text,
        program_system_or_equipmen text,
        program_system_or_equ_desc text,
        type_set_aside text,
        type_set_aside_description text,
        epa_designated_product text,
        epa_designated_produc_desc text,
        walsh_healey_act text,
        walsh_healey_act_descrip text,
        transaction_number text,
        sam_exception text,
        sam_exception_description text,
        city_local_government text,
        county_local_government text,
        inter_municipal_local_gove text,
        local_government_owned text,
        municipality_local_governm text,
        school_district_local_gove text,
        township_local_government text,
        us_state_government text,
        us_federal_government text,
        federal_agency text,
        federally_funded_research text,
        us_tribal_government text,
        foreign_government text,
        community_developed_corpor text,
        labor_surplus_area_firm text,
        corporate_entity_not_tax_e text,
        corporate_entity_tax_exemp text,
        partnership_or_limited_lia text,
        sole_proprietorship text,
        small_agricultural_coopera text,
        international_organization text,
        us_government_entity text,
        emerging_small_business text,
        c8a_program_participant text,
        sba_certified_8_a_joint_ve text,
        dot_certified_disadvantage text,
        self_certified_small_disad text,
        historically_underutilized text,
        small_disadvantaged_busine text,
        the_ability_one_program text,
        historically_black_college text,
        c1862_land_grant_college text,
        c1890_land_grant_college text,
        c1994_land_grant_college text,
        minority_institution text,
        private_university_or_coll text,
        school_of_forestry text,
        state_controlled_instituti text,
        tribal_college text,
        veterinary_college text,
        educational_institution text,
        alaskan_native_servicing_i text,
        community_development_corp text,
        native_hawaiian_servicing text,
        domestic_shelter text,
        manufacturer_of_goods text,
        hospital_flag text,
        veterinary_hospital text,
        hispanic_servicing_institu text,
        foundation text,
        woman_owned_business text,
        minority_owned_business text,
        women_owned_small_business text,
        economically_disadvantaged text,
        joint_venture_women_owned text,
        joint_venture_economically text,
        veteran_owned_business text,
        service_disabled_veteran_o text,
        contracts text,
        grants text,
        receives_contracts_and_gra text,
        airport_authority text,
        council_of_governments text,
        housing_authorities_public text,
        interstate_entity text,
        planning_commission text,
        port_authority text,
        transit_authority text,
        subchapter_s_corporation text,
        limited_liability_corporat text,
        foreign_owned_and_located text,
        american_indian_owned_busi text,
        alaskan_native_owned_corpo text,
        indian_tribe_federally_rec text,
        native_hawaiian_owned_busi text,
        tribally_owned_business text,
        asian_pacific_american_own text,
        black_american_owned_busin text,
        hispanic_american_owned_bu text,
        native_american_owned_busi text,
        subcontinent_asian_asian_i text,
        other_minority_owned_busin text,
        for_profit_organization text,
        nonprofit_organization text,
        other_not_for_profit_organ text,
        us_local_government text,
        referenced_idv_modificatio text,
        undefinitized_action text,
        undefinitized_action_desc text,
        domestic_or_foreign_entity text,
        domestic_or_foreign_e_desc text,
        annual_revenue text,
        division_name text,
        division_number_or_office text,
        number_of_employees text,
        vendor_alternate_name text,
        vendor_alternate_site_code text,
        vendor_enabled text,
        vendor_legal_org_name text,
        vendor_location_disabled_f text,
        vendor_site_code text,
        pulled_from text,
        last_modified text,
        initial_report_date text,
        referenced_idv_agency_name text,
        referenced_multi_or_single text,
        award_or_idv_flag text,
        place_of_perform_country_n text,
        place_of_perform_state_nam text
    )
);