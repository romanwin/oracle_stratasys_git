/************************************************************
*PURPOSE: To change/reset password of a user from backend   *
*************************************************************/
DECLARE
--  l_user_name    VARCHAR2(30):= UPPER('ROMAN.WINER');
--  l_user_name    VARCHAR2(30):= UPPER('YAEL.RAPHAELY');
  l_user_name    VARCHAR2(30):= UPPER('SHAI.SAPOSH');

  l_new_password VARCHAR2(30):= 'welcome4321';
  l_status       BOOLEAN;
BEGIN
  l_status   := fnd_user_pkg.ChangePassword ( username => l_user_name, 
                                              newpassword => l_new_password 
                                            );
  IF l_status =TRUE THEN
    dbms_output.put_line ('The password reset successfully for the User:'||l_user_name);
    COMMIT;
  ELSE
    DBMS_OUTPUT.put_line ('Unable to reset password due to'||SQLCODE||' '||SUBSTR(SQLERRM, 1, 100));
    ROLLBACK;
  END IF;
  
  -- Functional Administrator --
  fnd_user_pkg.addresp(username =>  l_user_name
                      ,resp_app => 'FND'
                      ,resp_key => 'FND_FUNC_ADMIN'
                      ,security_group => 'STANDARD'
                      ,description => 'Add Responsibility to USER using pl/sql'
                      ,start_date => SYSDATE
                      ,end_date => SYSDATE + 100);
  -- System Administrator --
  fnd_user_pkg.addresp(username =>  l_user_name
                      ,resp_app => 'SYSADMIN'
                      ,resp_key => 'SYSTEM_ADMINISTRATOR'
                      ,security_group => 'STANDARD'
                      ,description => 'Add Responsibility to USER using pl/sql'
                      ,start_date => SYSDATE
                      ,end_date => SYSDATE + 100);

  -- XML Publisher Administrator --
  fnd_user_pkg.addresp(username =>  l_user_name
                      ,resp_app => 'XDO'
                      ,resp_key => 'XDO_ADMINISTRATION'
                      ,security_group => 'STANDARD'
                      ,description => 'Add Responsibility to USER using pl/sql'
                      ,start_date => SYSDATE
                      ,end_date => SYSDATE + 100);
  -- Alert Manager --
  fnd_user_pkg.addresp(username =>  l_user_name
                      ,resp_app => 'ALR'
                      ,resp_key => 'ALERT_MANAGER'
                      ,security_group => 'STANDARD'
                      ,description => 'Add Responsibility to USER using pl/sql'
                      ,start_date => SYSDATE
                      ,end_date => SYSDATE + 100);

fnd_user_pkg.addresp(username =>  l_user_name
                      ,resp_app => 'ONT'
                      ,resp_key => 'XX_IMPL_MANUFACTURING' -- Applications Operations - IT USE ONLY
                      ,security_group => 'STANDARD'
                      ,description => 'Add Responsibility to USER using pl/sql'
                      ,start_date => SYSDATE
                      ,end_date => SYSDATE + 100);                      

fnd_user_pkg.addresp(username =>  l_user_name
                      ,resp_app => 'FND'
                      ,resp_key => 'APPLICATION_DEVELOPER'
                      ,security_group => 'STANDARD'
                      ,description => 'Add Responsibility to USER using pl/sql'
                      ,start_date => SYSDATE
                      ,end_date => SYSDATE + 100);                      

fnd_user_pkg.addresp(username =>  l_user_name
                      ,resp_app => 'FND'
                      ,resp_key => 'FNDWF_ADMIN_WEB_NEW' -- Workflow Administrator Web (New)
                      ,security_group => 'STANDARD'
                      ,description => 'Add Responsibility to USER using pl/sql'
                      ,start_date => SYSDATE
                      ,end_date => SYSDATE + 100);                      

fnd_user_pkg.addresp(username =>  l_user_name
                      ,resp_app => 'PER'
                      ,resp_key => 'GLOBAL_HRMS_MANAGER' -- Global HRMS Manager
                      ,security_group => 'STANDARD'
                      ,description => 'Add Responsibility to USER using pl/sql'
                      ,start_date => SYSDATE
                      ,end_date => SYSDATE + 100);                      

fnd_user_pkg.addresp(username =>  l_user_name
                      ,resp_app => 'AK'
                      ,resp_key => 'FWK_TBX_TUTORIAL' -- Global HRMS Manager
                      ,security_group => 'STANDARD'
                      ,description => 'Add Responsibility to USER using pl/sql'
                      ,start_date => SYSDATE
                      ,end_date => SYSDATE + 100);                      
                      
                      

                      



  COMMIT;
  DBMS_OUTPUT.put_line ('Responsibility Added Successfully');                      
EXCEPTION
  WHEN OTHERS THEN
     DBMS_OUTPUT.put_line ( ' Responsibility is not added due to ' || SQLCODE || SUBSTR (SQLERRM, 1, 100));
     ROLLBACK;  
  
END;
