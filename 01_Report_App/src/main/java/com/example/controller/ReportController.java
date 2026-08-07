package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.entity.CitizenPlan;
import com.example.request.SearchRequest;
import com.example.service.ReportService;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class ReportController {

	@Autowired
	private ReportService service;

	@GetMapping("/pdf")
	public void pdfExport(HttpServletResponse response,Model model) throws Exception {
		response.setContentType("application/pdf");
		response.addHeader("Content-Disposition", "attachment;filename=plans.pdf");
		boolean status = service.exportPdf(response);
		if(status)
		{
			model.addAttribute("msg","Pdf Report sent to tour Email");
		}
	}

	@GetMapping("/excel")
	public void excelExport(HttpServletResponse response,Model model) throws Exception {
		response.setContentType("application/octet-stream");
		response.addHeader("Content-Disposition", "attachment;filename=plans.xls");
		boolean status = service.exportExcel(response);
		if(status)
		{
			model.addAttribute("msg","Excel Report sent to tour Email");
		}
	}

	@PostMapping("/search")
	public String handleSearch(SearchRequest search, Model model) {

		List<CitizenPlan> plans = service.search(search);
		model.addAttribute("search", search);
		model.addAttribute("plans", plans);

		init(model);

		return "index";
	}

	/**
	 * This Method is used to load index page
	 * 
	 * @param model
	 * @return String
	 */

	@GetMapping("/")
	public String indexPage(Model model) {
		model.addAttribute("search", new SearchRequest());
		init(model);

		return "index";
	}

	private void init(Model model) {
		model.addAttribute("names", service.getPlanNames());
		model.addAttribute("status", service.getPlanStatuses());
	}

}
