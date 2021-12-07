package com.teraenergy.dashboard.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.teraenergy.dashboard.service.ScheduleService;

import net.sf.json.JSONArray;


//@RestController
@Controller
public class ScheduleController {

	@Autowired
	ScheduleService s;

	/* 캘린더 일정 정보 가져오기 */
	@RequestMapping(value = "/teware/calender/ajax_get_calender", method = RequestMethod.GET)
	public @ResponseBody List<Object> get_calender() throws Exception {
		
		List<Object> getData = s.get_calender();
		
		return getData; 
	}
	
	/* 일정 등록 */
	@RequestMapping("/teware/calender/ajax_insert_schedule")
	public String insert_schedule( @RequestParam Map<String, Object> eventData) 
			throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int all_day_num;
		int event_type_num;
		
		if(eventData.get("eventData[all_day]").equals("false")) {
			all_day_num = 0;
		} else {
			all_day_num = 1;
		}
		
		if(eventData.get("eventData[event_type]").equals("1")) {
			event_type_num = 1;
		} else if(eventData.get("eventData[event_type]").equals("2")) {
			event_type_num = 2;
		} else if(eventData.get("eventData[event_type]").equals("3")) {
			event_type_num = 3;
		} else {
			event_type_num = 0;
		}
		
		map.put("title", eventData.get("eventData[title]"));
		map.put("start", eventData.get("eventData[start]"));
		map.put("end", eventData.get("eventData[end]"));
		map.put("description", eventData.get("eventData[description]"));
		map.put("event_type", event_type_num);
		map.put("write_user", eventData.get("eventData[write_user]"));
		map.put("backgroundColor", eventData.get("eventData[backgroundColor]"));
		map.put("textColor", eventData.get("eventData[textColor]"));
		map.put("all_day", all_day_num);
		map.put("target_user", eventData.get("eventData[target_user]"));
		
		System.out.println("파라미터 확인" + eventData);
		System.out.println("파라미터 확인 - 맵 " + map);
		
		s.insert_schedule(map);
		
		return "redirect:/dashboard";
	}
	
	/* 일정 수정 */
	@RequestMapping("/teware/calender/ajax_update_schedule")
	public String update_schedule( @RequestParam Map<String, Object> eventData) 
			throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int all_day_num;
		int event_type_num;
		int id_num = Integer.parseInt((String) eventData.get("eventData[id]"));
		
		if(eventData.get("eventData[all_day]").equals("false")) {
			all_day_num = 0;
		} else {
			all_day_num = 1;
		}
		
		if(eventData.get("eventData[event_type]").equals("1")) {
			event_type_num = 1;
		} else if(eventData.get("eventData[event_type]").equals("2")) {
			event_type_num = 2;
		} else if(eventData.get("eventData[event_type]").equals("3")) {
			event_type_num = 3;
		} else {
			event_type_num = 0;
		}
		
		map.put("title", eventData.get("eventData[title]"));
		map.put("start", eventData.get("eventData[start]"));
		map.put("end", eventData.get("eventData[end]"));
		map.put("description", eventData.get("eventData[description]"));
		map.put("event_type", event_type_num);
		map.put("write_user", eventData.get("eventData[write_user]"));
		map.put("backgroundColor", eventData.get("eventData[backgroundColor]"));
		map.put("textColor", eventData.get("eventData[textColor]"));
		map.put("all_day", all_day_num);
		map.put("id",  eventData.get("eventData[id]"));
		map.put("target_user", eventData.get("eventData[target_user]"));
		
		System.out.println("업데이트 파라미터 확인" + eventData);
		System.out.println("업데이트 파라미터 확인 - 맵 " + map);
		
		s.update_schedule(map);
		
		return "redirect:/dashboard";
	}
	
	/* 일정 삭제 */
	@RequestMapping(value = "/teware/calender/ajax_delete_schedule", method = RequestMethod.POST)
	public String delete_schedule(@RequestBody String check_id) throws Exception {
		
		String check_id_str = check_id.replace("check_id=", ""); 
		
		int id_num = Integer.parseInt((String) check_id_str);
		
		System.out.println("아아아아아아아 : " + id_num);
		
		s.delete_schedule(id_num);

		return "redirect:/dashboard";

	}
}