<%-- 
    Document   : ViewMatInvoice
    Created on : 15 Oct, 2023, 4:34:38 PM
    Author     : GKV
--%>
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
 FileOutputStream fos = new FileOutputStream("C:\\myproject\\"+name+"_Material.pdf");
 Document doc = new Document();
 PdfWriter writer = PdfWriter.getInstance(doc, fos);     
 doc.open();   
 
 PdfPTable table = new PdfPTable(6);
 
  PdfPCell cell1 = new PdfPCell(new Paragraph("Material Category"));
  PdfPCell cell2 = new PdfPCell(new Paragraph("Brand"));
  PdfPCell cell3 = new PdfPCell(new Paragraph("Units"));
  PdfPCell cell4 = new PdfPCell(new Paragraph("Price"));
  PdfPCell cell5 = new PdfPCell(new Paragraph("noof"));
  PdfPCell cell6 = new PdfPCell(new Paragraph("TOTAL"));
  
  table.addCell(cell1);
  table.addCell(cell2);
  table.addCell(cell3);
  table.addCell(cell4);
  table.addCell(cell5);
  table.addCell(cell6);

  ResultSet rr=Queries.getExecuteQuery("select * from bookmet where uid='"+id+"' and status!='Cancelled'");
  
  int t=0;
  while(rr.next()){
     int price=Integer.parseInt(rr.getString("price"));
     int noof=Integer.parseInt(rr.getString("noof"));
     int total=price*noof; 
     t=t+total;
     String tt=""+total+" Rs/-";
  PdfPCell cell7 = new PdfPCell(new Paragraph(rr.getString("mcategory")));
  PdfPCell cell8 = new PdfPCell(new Paragraph(rr.getString("name")));
  PdfPCell cell9 = new PdfPCell(new Paragraph(rr.getString("units")));
  PdfPCell cell10 = new PdfPCell(new Paragraph(rr.getString("price")+" Rs/-"));
  PdfPCell cell11 = new PdfPCell(new Paragraph(rr.getString("noof")));
  PdfPCell cell12 = new PdfPCell(new Paragraph(tt));

  table.addCell(cell7);
  table.addCell(cell8);
  table.addCell(cell9);
  table.addCell(cell10);
  table.addCell(cell11);
  table.addCell(cell12);
  }
  String f=""+t+" Rs/-";
 PdfPCell cell13 = new PdfPCell(new Paragraph(f));
 table.addCell("");
 table.addCell("");
 table.addCell("");
 table.addCell("");
 table.addCell("TOTAL PRICE");
 table.addCell(cell13);
 
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
doc.add(new Paragraph("Mr/Miss: "+name+"...!!                                                                       Date: "+gg));  
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
   
FileInputStream fis=new FileInputStream("C:\\myproject\\"+name+"_Material.pdf");

InputStream ins = (InputStream)fis;

Connection con=DBCon.getConnection();
PreparedStatement pst=con.prepareStatement("insert into invoice values(null,?,?)");
pst.setString(1, id);
pst.setBlob(2, ins);

pst.executeUpdate();

ResultSet r=Queries.getExecuteQuery("select max(id) from invoice where uid='"+id+"'");
if(r.next()){
  int i=r.getInt(1);

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