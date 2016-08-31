package edu.mum.utils;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class CustomDate extends SimpleTagSupport {
	String createdDate;
	String updatedDate;
	
	public void doTag() throws JspException, IOException {
	    JspWriter out = getJspContext().getOut();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm a");
		SimpleDateFormat outFormat = new SimpleDateFormat("MM/dd/yyyy ha");
		
		try {
			Date createdDate = format.parse(this.createdDate);
			Date updatedDate = format.parse(this.updatedDate);

			out.println("created - " + outFormat.format(createdDate) + 
					" updated - " + outFormat.format(updatedDate));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	  
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}

	public void setUpdatedDate(String updatedDate) {
		this.updatedDate = updatedDate;
	}
}