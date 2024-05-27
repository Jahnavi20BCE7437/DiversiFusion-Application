
<%@page import="java.io.OutputStream"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.database.DBCon"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.sun.javafx.font.FontFactory"%>
<%@page import="java.awt.Font"%>
<%@page import="java.io.FileOutputStream"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String id=(String)session.getAttribute("id");
         String email=(String)session.getAttribute("email");
        String mobile=(String)session.getAttribute("mobile");
        String name=(String)session.getAttribute("name");

try{
 FileOutputStream fos = new FileOutputStream("C:\\myproject\\"+name+"_Appliance.pdf");
 Document doc = new Document();
 PdfWriter writer = PdfWriter.getInstance(doc, fos);     
 doc.open();   
 
 PdfPTable table = new PdfPTable(4);
 
  PdfPCell cell1 = new PdfPCell(new Paragraph("Product Name"));
  PdfPCell cell2 = new PdfPCell(new Paragraph("Price"));
  PdfPCell cell3 = new PdfPCell(new Paragraph("Noof Products"));
  PdfPCell cell4 = new PdfPCell(new Paragraph("Total"));
  
  table.addCell(cell1);
  table.addCell(cell2);
  table.addCell(cell3);
  table.addCell(cell4);

  ResultSet rr=Queries.getExecuteQuery("select * from bookappliance where uid='"+id+"'and status!='Cancelled'");
  
  int t=0;
  while(rr.next()){
     int price=Integer.parseInt(rr.getString("price"));
     int noof=Integer.parseInt(rr.getString("noof"));
     int total=price*noof; 
     t=t+total;
     String tt=""+total+" Rs/-";
     System.out.println(total);
  PdfPCell cell5 = new PdfPCell(new Paragraph(rr.getString("name")));
  PdfPCell cell6 = new PdfPCell(new Paragraph(rr.getString("price")+" Rs/-"));
  PdfPCell cell7 = new PdfPCell(new Paragraph(rr.getString("noof")));
  PdfPCell cell8 = new PdfPCell(new Paragraph(tt));

  table.addCell(cell5);
  table.addCell(cell6);
  table.addCell(cell7);
  table.addCell(cell8);
  }
  String f=""+t+" Rs/-";
 PdfPCell cell9 = new PdfPCell(new Paragraph(f));
 table.addCell("");
 table.addCell("");
 table.addCell("TOTAL PRICE");
 table.addCell(cell9);
 
 Date d=new Date();
 SimpleDateFormat d1=new SimpleDateFormat("dd:MM:yyyy");
 String gg=d1.format(d);
 
 //adding paragraphs to the PDF  
doc.add(new Paragraph("                                                      BILL INVOICE ")); 
doc.add(new Paragraph("-----------------------------------------------------------------------------------------------------------------------"));
doc.add(new Paragraph("                                       "));  
doc.add(new Paragraph("                                       ")); 
 
doc.add(new Paragraph("Hello..!!"));  
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       "));  
doc.add(new Paragraph("Mr/Miss: "+name+"...!!                                                  Date: "+gg));  
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       "));  
doc.add(new Paragraph(""));  
doc.add(table);  
doc.add(new Paragraph("                                       "));  
doc.add(new Paragraph("                                       ")); 
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("            THANK YOU                  ")); 
doc.add(new Paragraph("                                       ")); 
doc.add(new Paragraph("                                       "));
doc.add(new Paragraph("                                       ")); 

doc.add(new Paragraph("                                       ")); 
doc.add(new Paragraph("                                       ")); 
//closes the document  
doc.close();  
//closes the output stream  
fos.close();   
   
FileInputStream fis=new FileInputStream("C:\\myproject\\"+name+"_Appliance.pdf");

InputStream ins = (InputStream)fis;

Connection con=DBCon.getConnection();
PreparedStatement pst=con.prepareStatement("insert into invoice values(null,?,?)");
pst.setString(1, id);
pst.setBlob(2, ins);

pst.executeUpdate();

ResultSet r=Queries.getExecuteQuery("select max(id) from invoice where uid='"+id+"'");
if(r.next()){
  int i=r.getInt(1);
  System.out.println("user id: "+i);
  %>
  <center>
 <embed src="ViewPDF.jsp?id=<%=i%>" width="1000" height="900"/>
  </center>
  <%
}




}catch(Exception e){
    System.out.println(e);
}

%>