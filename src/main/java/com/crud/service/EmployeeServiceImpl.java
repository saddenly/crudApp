package com.crud.service;

import com.crud.dao.EmployeeDAO;
import com.crud.entity.Employee;
import com.crud.exception.EmployeeNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    private final EmployeeDAO employeeDAO;

    public EmployeeServiceImpl(EmployeeDAO employeeDAO) {
        this.employeeDAO = employeeDAO;
    }

    @Override
    @Transactional
    public List<Employee> getAllEmployees() {
        return employeeDAO.getAllEmployees();
    }

    @Override
    @Transactional
    public void saveEmployee(Employee employee) {
        employeeDAO.saveEmployee(employee);
    }

    @Override
    @Transactional
    public Employee getEmployee(int id) throws EmployeeNotFoundException {
        Optional<Employee> optional = Optional.ofNullable(employeeDAO.getEmployee(id));
        if (optional.isPresent()) {
            return optional.get();
        }
        throw new EmployeeNotFoundException("Could find any employee with such ID");
    }

    @Override
    @Transactional
    public void deleteEmployee(int id) throws EmployeeNotFoundException {
        Optional<Employee> optional = Optional.ofNullable(employeeDAO.getEmployee(id));
        if (optional.isPresent()) {
            employeeDAO.deleteEmployee(id);
        } else {
            throw new EmployeeNotFoundException("Could find any employee with such ID");
        }
    }
}