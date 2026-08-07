package com.example.service;

import java.util.List;

import com.example.entity.CitizenPlan;
import com.example.request.SearchRequest;

import jakarta.servlet.http.HttpServletResponse;

public interface ReportService {
	
	public List<String> getPlanNames(); 
	
	public List<String> getPlanStatuses(); 
	
	public List<CitizenPlan> search(SearchRequest request);
	
	public boolean exportExcel(HttpServletResponse response) throws Exception;
	
	public boolean exportPdf(HttpServletResponse response) throws Exception;
	

}
