package com.example.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.springframework.stereotype.Component;

import com.example.entity.CitizenPlan;
import com.lowagie.text.Document;
import com.lowagie.text.PageSize;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;

import jakarta.servlet.http.HttpServletResponse;

@Component
public class PdfGenerator {
	
	public void generate(HttpServletResponse response,List<CitizenPlan> plans, File f) throws Exception
	{
		Document document = new Document(PageSize.A4);

		PdfWriter.getInstance(document, response.getOutputStream());
        PdfWriter.getInstance(document, new FileOutputStream(f));
		
		document.open();

		Paragraph p = new Paragraph("Citizen Plans Info");
		document.add(p);
		PdfPTable table = new PdfPTable(7);

		table.addCell("Id");
		table.addCell("Name");
		table.addCell("Plan");
		table.addCell("Status");
		table.addCell("Start Date");
		table.addCell("End Date");
		table.addCell("Benefit");

		for (CitizenPlan plan : plans) {

			table.addCell(String.valueOf(plan.getCitizenId()));
			table.addCell(plan.getCitizenName());
			table.addCell(plan.getPlanName());
			table.addCell(plan.getPlanStatus());

			table.addCell(plan.getPlanStartDate() == null ? "N/A" : plan.getPlanStartDate().toString());

			table.addCell(plan.getPlanEndDate() == null ? "N/A" : plan.getPlanEndDate().toString());

			table.addCell(plan.getBenefitAmt() == null ? "N/A" : String.valueOf(plan.getBenefitAmt()));
		}
		
		document.add(table);
		document.close();

	}

}
