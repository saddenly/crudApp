package com.crud.service;

import com.crud.entity.Employee;
import com.crud.exception.EmployeeNotFoundException;

import java.util.List;

public interface EmployeeService {
    List<Employee> getAllEmployees();

    void saveEmployee(Employee employee);

    Employee getEmployee(int id) throws EmployeeNotFoundException;

    void deleteEmployee(int id) throws EmployeeNotFoundException;
}