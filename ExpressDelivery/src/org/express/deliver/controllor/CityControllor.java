package org.express.deliver.controllor;

import javax.annotation.Resource;

import org.express.deliver.manager.ICityManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/city")
public class CityControllor {
	@Resource(name = "cityManager")
	private ICityManager cityManager;
}
