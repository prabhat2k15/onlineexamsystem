package mybeanproject;
import java.sql.*;
public class ProjectAddRecord
{
String name,sex,stream,username,pwd,fname,mname,address,imark,district,state,payment;
int age,marks10,marks12,marksbtech;
long pcode,cno;	
	
	
	public void setName(String name)
	{
	 this.name=name;
	}
		public String getName()
		{ return name; }
	
	public void setSex(String sex)
	{
	 this.sex=sex;
	 }
		public String getSex()
		{ return sex; }
	 
	public void setStream(String stream)
	{
	   this.stream=stream;
	}
		public String getStream()
		{ return stream; }
	 
	public void setUsername(String username)
	{
	 this.username=username;
	}
		public String getUsername()
		{ return username;}
	 
	public void setPwd(String pwd)
	{
	   this.pwd=pwd;
	}
		public String getPwd()
		{  return pwd;  }
	  
	public void setAge(int age)
	{
	    this.age=age;
	}
		public int getAge()
		{ return age;  }
	public void setMarks12(int marks12)
	{
	  this.marks12=marks12;
	}
		public int getMarks12()
		{  return marks12;  }
	   
	public void setMarks10(int marks10)
	{
	  this.marks10=marks10;
	}
		public int getMarks10()
		{   return marks10;  }
		
	public void setMarksbtech(int marksbtech)
	{
      this.marksbtech=marksbtech;
	}
		public int getMarksbtech()
		{ return marksbtech; }
	  
	public void setFname(String fname)
	{
	 this.fname=fname;
	}
		public String getFname()
		{ return fname; }
	
	public void setMname(String mname)
	{
	 this.mname=mname;
	}
		public String getMname()
		{ return mname; }
	
	public void setImark(String imark)
	{
	 this.imark=imark;
	}
		public String getImark()
		{ return imark; }
	
	public void setAddress(String address)
	{
	 this.address=address;
	}
		public String getAddress()
		{ return address; }
		
	public void setDistrict(String district)
	{
	 this.district=district;
	}
		 
		public String getDistrict()
		{ return district; }
	
	public void setState(String state)
	{
	 this.state=state;
	}
		 
		public String getState()
		{ return state; }
		
	public void setPcode(long pcode)
	{
	 this.pcode=pcode;
	}
		public long getPcode()
		{ return pcode; }
		
	public void setCno(long cno)
	{
	 this.cno=cno;
	}
		public long getCno()
		{ return cno; }
	
		public void setPayment(String payment)
	{
	 this.payment=payment;
	}
		 
		public String getPayment()
		{ return payment; }
	
	  public boolean register()
	{ 	
	  try {
		 Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver is loaded");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/prabhat","root","student554986");
		System.out.println("connection Obtained");
		PreparedStatement ps=con.prepareStatement("insert into regpage value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			//PreparedStatement ps=con.prepareStatement("insert into regpage (Name,Age,Sex,Uname,Pwd,Stream,Marks12,Marks10,Marks_btech,F_Name,M_Name,Address,Dist,State,Pin,Imark,Contact,ModePay) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			//ps.setInt(1,"");
			ps.setString(1,name);
			ps.setInt(2,age);
			ps.setString(3,sex);
			ps.setString(4,username);
			ps.setString(5,pwd); 
			ps.setString(6,stream);
			ps.setInt(7,marks12);
			ps.setInt(8,marks10);
			ps.setInt(9,marksbtech);
			ps.setString(10,fname);
			ps.setString(11,mname);
			ps.setString(12,address);
			ps.setString(13,district);
			 
			ps.setLong(14,pcode);
			ps.setString(15,imark);
			ps.setLong(16,cno);
			ps.setString(17,state);
			ps.setString(18,payment); 
			/*ps2.setString(1,name);
			ps2.setInt(2,11);
			ps2.setString(3,address);
			ps2.setString(4,district);
			ps2.setLong(5,pcode);
			ps2.setString(6,imark);
			ps2.setLong(7,cno);
/*}//try block
		catch(SQLException se)
		{  se.printStackTrace();  }
		catch(ClassNotFoundException cnfe)
		{ cnfe.printStackTrace();  }*/
		int x=ps.executeUpdate();
		//int y=ps2.executeUpdate();
		System.out.println("x="+x);//+",y="+y);
		if(x>0)// && y>0)
		{
		return true; }
		else
		{ throw new Exception(); }
		}//try
		catch(Exception e)
		{
		  e.printStackTrace();
		  return false;
		  }
	}
		
		
	  
}//class 