INSERT INTO public.concept (concept_id, concept_name, domain_id, vocabulary_id, concept_class_id, standard_concept, concept_code, valid_start_date, valid_end_date, invalid_reason) VALUES (2000000000, 'Syphilis Registry', 'Metadata', 'Vocabulary', 'Vocabulary', null, 'GTRI Generated', '2021-01-01', '2099-12-31', null);

INSERT INTO public.vocabulary (vocabulary_id, vocabulary_name, vocabulary_reference, vocabulary_version, vocabulary_concept_id) VALUES ('Syphilis Registry', 'Syphilis Registry', 'https://github.com/smart-pacer-registry', 'Version 1.0', 2000000000);
