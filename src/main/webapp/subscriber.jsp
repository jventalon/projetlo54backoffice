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
String nameOfTextFile = "E:/WebLogFile.txt";
String endWhile;

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
        //Check if the file already exists
        //If not, we create one else we append to the existing one and insert new line
        FileWriter logFile;
        File log= new File(nameOfTextFile);
        if(!log.exists()){
            logFile = new FileWriter(nameOfTextFile);
        }
        else logFile = new FileWriter(nameOfTextFile,true);
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
        logFile.close();
        connection.close();

%>