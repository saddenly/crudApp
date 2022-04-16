package com.crud.controller;

import com.crud.entity.Employee;
import com.crud.exception.EmployeeNotFoundException;
import com.crud.service.EmployeeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class MyController {
    private final EmployeeService service;

    public MyController(EmployeeService service) {
        this.service = service;
    }

    @RequestMapping("/")
    public String showAllEmployees(Model model) {
        List<Employee> allEmployees = service.getAllEmployees();
        model.addAttribute("allEmps", allEmployees);
        return "all-employees";
    }

    @RequestMapping("/add")
    public String addNewEmployee(Model model) {
        Employee employee = new Employee();
        model.addAttribute("employee", employee);
        model.addAttribute("pageTitle", "Add new employee");
        return "employee-info";
    }

    @PostMapping("/save")
    public String saveEmployee(@ModelAttribute("employee") Employee employee,
                               RedirectAttributes ra) {
        service.saveEmployee(employee);
        ra.addFlashAttribute("message", "Employee has been saved successfully");
        return "redirect:/";
    }

    @RequestMapping("/update{id}")
    public String updateEmployee(@PathVariable @RequestParam("empId") Integer id, Model model,
                                 RedirectAttributes ra) {
        try {
            model.addAttribute("employee", service.getEmployee(id));
            model.addAttribute("pageTitle", "Edit employee(ID = " + id + ")");
            return "employee-info";
        } catch (EmployeeNotFoundException e) {
            ra.addFlashAttribute("message", e.getMessage());
            return "redirect:/";
        }
    }

    @RequestMapping("/delete{id}")
    public String deleteEmployee(@PathVariable @RequestParam("empId") Integer id, RedirectAttributes ra) {
        try {
            service.deleteEmployee(id);
            ra.addFlashAttribute("message", "The employee ID = " + id +
                    " has been deleted");
        } catch (EmployeeNotFoundException e) {
            ra.addFlashAttribute("message", e.getMessage());
        }
        return "redirect:/";
    }
}