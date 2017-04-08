import java.sql.*;
import java.util.*;
class Backup_DB
{
    public static void main(String args[])
	 {
	        int choice;
	 Scanner ss=new Scanner(System.in);
	   try
	      {
		  //Driver loading...
	  Class.forName("com.mysql.jdbc.Driver");
	  System.out.println("Driver is Loaded");
	  //Getting Connection...
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","");
	  System.out.println("Connection Eshtablished");
	 
	  Statement st=con.createStatement();
	  ResultSet rs;
	  
	  String php="create table php(No int(3),Ques varchar(50),A varchar(50),B varchar(50),C varchar(50),D varchar(50),correct varchar(2),Expl varchar(50));";
	  st.executeUpdate(php);
	  
	  
	  String feedback="create table feedback(SNo int NOT NULL AUTO_INCREMENT,Name varchar(20),Feedback varchar(50),PRIMARY KEY(SNo));";
	  st.executeUpdate(feedback);
	  
	  String regpage="create table regpage(Name varchar(20),Age int(3),Sex char(1),user varchar(20),Pwd varchar(20),Stream varchar(5),Marks12 int(4),Marks10 int(4),MBtech int(4),Fname varchar(20),Mname varchar(20),Addr varchar(50),Dist varchar(20),Pcode int(6),imark varchar(20),cno int(12),state varchar(20),payment varchar(10));";
	  st.executeUpdate(regpage);
	  
	  String admin="create table admin(username varchar(20),Pwd varchar(20))";
	  st.executeUpdate(admin);
	  
	  String result="create table result(Name varchar(50),Fname varchar(100),Marks varchar(5))";
	  st.executeUpdate(admin);
	  
	  System.out.println("Table Created");
	    
					   
		}	   
			catch(SQLException se)
			 {
			    System.out.println("Warning !!! SQL Exception"); 
				se.printStackTrace();
				System.out.println("Error code="+se.getErrorCode());
			  }
			  catch(ClassNotFoundException cnfe)
			  {
			    System.out.println("Warning !!! Class Not Found Not Exception");
			  }
	  }
}	  
	   