DELETE FROM `user_tasks`;
DELETE FROM `subgroups`;
DELETE FROM `group_members`;
DELETE FROM `assigned_tasks`;
DELETE FROM `groups`;
DELETE FROM `tests`;
DELETE FROM `questions`;
DELETE FROM `group_tests`;
DELETE FROM `users` WHERE id > '106';

INSERT INTO `users` (`id`, `first_name`, `email`, `password`, `is_active`, `role`, `last_name`)
VALUES
  (NULL, 'Mentee', 'Mentee_Mentee@epam.com', 'e1b9c678f4e9d424b7eefdb4453f9d34', 1, 'MENTEE', 'Mentee'),
  (NULL, 'Mentor', 'Mentor_Mentor@epam.com', 'a7330e1cafee6ad1ff711705daa5116b', 1, 'MENTOR', 'Mentor'),
  (NULL, 'LabManager', 'LabManager_LabManager@epam.com', 'c56bf96d6a5b6f7b8f775a616b44faa7', 1, 'LAB_MANAGER', 'LabManager'),
  (NULL, 'Resource', 'Resource_Resource@epam.com', '243049dd1dfa7c141e9650a36c00038d', 1, 'RESOURCE_MANAGER', 'Resource'),

(NULL, 'AutoBMentee', 'AutoBMentee_BMentee@epam.com', 'e1b9c678f4e9d424b7eefdb4453f9d34', 1, 'MENTEE', 'BMentee'),
(NULL, 'AutoCMentee', 'AutoCMentee_CMentee@epam.com', 'e1b9c678f4e9d424b7eefdb4453f9d34', 1, 'MENTEE', 'CMentee'),
(NULL, 'AutoDMentee', 'AutoDMentee_DMentee@epam.com', 'e1b9c678f4e9d424b7eefdb4453f9d34', 1, 'MENTEE', 'DMentee'),
(NULL, 'AutoEMentee', 'AutoEMentee_EMentee@epam.com', 'e1b9c678f4e9d424b7eefdb4453f9d34', 1, 'MENTEE', 'EMentee'),
(NULL, 'AutoFMentee', 'AutoFMentee_FMentee@epam.com', 'e1b9c678f4e9d424b7eefdb4453f9d34', 1, 'MENTEE', 'FMentee'),

(NULL, 'AutoAMentor', 'AutoAMentor_Mentor@epam.com', 'a7330e1cafee6ad1ff711705daa5116b', 1, 'MENTOR', 'Mentor'),
(NULL, 'AutoBMentor', 'AutoBMentor_Mentor@epam.com', 'a7330e1cafee6ad1ff711705daa5116b', 1, 'MENTOR', 'Mentor'),
(NULL, 'AutoCMentor', 'AutoCMentor_Mentor@epam.com', 'a7330e1cafee6ad1ff711705daa5116b', 1, 'MENTOR', 'Mentor'),
(NULL, 'AutoDMentor', 'AutoDMentor_Mentor@epam.com', 'a7330e1cafee6ad1ff711705daa5116b', 1, 'MENTOR', 'Mentor'),

(NULL, 'AutoALabManager', 'AutoALabManager_LabManager@epam.com', 'c56bf96d6a5b6f7b8f775a616b44faa7', 1, 'LAB_MANAGER', 'LabManager'),
(NULL, 'AutoBLabManager', 'AutoBLabManager_LabManager@epam.com', 'c56bf96d6a5b6f7b8f775a616b44faa7', 1, 'LAB_MANAGER', 'LabManager'),
(NULL, 'AutoCLabManager', 'AutoCLabManager_LabManager@epam.com', 'c56bf96d6a5b6f7b8f775a616b44faa7', 1, 'LAB_MANAGER', 'LabManager');

