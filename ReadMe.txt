In all forms of the interface, if you want to test with your own server you have to change this:
private String sa = "data source=tcp:mednat.ieeta.pt\\SQLSERVER,8101;DATABASE=p8g6;UID=p8g6;PASSWORD=123Joao@Bruno";
to

private String sa = "data source=<<yourServer>>,8101;DATABASE=<<databasename>>;UID=<<user ID>;PASSWORD=<<Password>>";

        