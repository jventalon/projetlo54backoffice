<%@page import="java.util.Date"%>
<%@page import="org.apache.activemq.ActiveMQConnection"%>
<%@page import="javax.jms.Message"%>
<%@page import="javax.jms.TextMessage"%>
<%@page import="javax.jms.TopicSubscriber"%>
<%@page import="javax.jms.Topic"%>
<%@page import="org.apache.activemq.ActiveMQConnectionFactory"%>
<%@page import="javax.jms.Connection"%>
<%@page import="javax.jms.Session"%>
<%@page import="org.apache.log4j.BasicConfigurator"%>
<%@page import="javax.jms.ConnectionFactory"%>
<%@ page import="java.io.*"  %>
<%
String str = "print me";
String subject ="TPLO54";
String url = ActiveMQConnection.DEFAULT_BROKER_URL;
String filePath = "WebLogFile.txt";
String endWhile;
String windowsPath = "C:/ProjetLO54";
String linuxPath = "~/ProjetLO54";
String osName = System.getProperty ( "os.name" );

BasicConfigurator.configure();

        // Creatng the connection
        ConnectionFactory connectionFactory = new ActiveMQConnectionFactory(url);
        Connection connection = connectionFactory.createConnection();
        //Set the ID of the subscriber
        connection.setClientID("2");
        connection.start();
        // Creating session for seding messages
        Session subscriberSession = connection.createSession(false,Session.AUTO_ACKNOWLEDGE);
        // Creating the topic if not existing
        Topic topic = subscriberSession.createTopic(subject); 
        //Creation of a durable subscriber
        TopicSubscriber consumer = subscriberSession.createDurableSubscriber(topic,"AppliWeb");  
        
         if(osName.matches(".*Windows.*")){
            //Create the directory in windows if not eists
            if( !new File(windowsPath).exists()){
                new File(windowsPath).mkdir();
                System.out.println("Created "+ windowsPath+ " directory");
            }
            filePath= windowsPath+"/"+filePath;
        }
        
        else{
            if(osName.matches(".*Linux.*")){
                //Create the directory in linux if not eists
                if( !new File(linuxPath).mkdirs()){
                    new File(linuxPath).mkdir();
                    System.out.println("Created" + linuxPath+ " directory");
                }
                filePath= linuxPath+"/"+filePath;
            }
        }


        //Check if the file already exists
        //If not, we create one else we append to the existing one and insert new line
        FileWriter logFile;
        File log= new File(filePath);
        if(!log.exists()){
            logFile = new FileWriter(filePath);
        }
        else {
            logFile = new FileWriter(filePath,true);
        }
        logFile.write(System.getProperty("line.separator"));
        //Significate the dtart of listening with the date
        logFile.write("------------- Begin listening : "+new Date().toString()+ " -------------");
        logFile.write(System.getProperty("line.separator"));
        
        // Waiting for the message

        endWhile="no";
        while(endWhile.equals("no")){
        Message message = consumer.receive();
        if (message instanceof TextMessage) {

            TextMessage textMessage = (TextMessage) message;
            System.out.println("Received message '" + textMessage.getText()+ "'");
            //write the message and \n in the log file
            logFile.write(textMessage.getText());
            logFile.write(System.getProperty("line.separator"));
            if(textMessage.getText().equals("close connection")){
                endWhile="true";
            }
        }
        }
        //Signifiacte the end of he listening with the date
        logFile.write("------------- Stop listening  : "+new Date().toString()+ " -------------");
        logFile.close();
        connection.close();

%>