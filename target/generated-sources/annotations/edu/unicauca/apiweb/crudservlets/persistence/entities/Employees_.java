package edu.unicauca.apiweb.crudservlets.persistence.entities;

import edu.unicauca.apiweb.crudservlets.persistence.entities.Employees;
import edu.unicauca.apiweb.crudservlets.persistence.entities.Offices;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-12-05T21:55:50")
@StaticMetamodel(Employees.class)
public class Employees_ { 

    public static volatile SingularAttribute<Employees, String> lastName;
    public static volatile SingularAttribute<Employees, String> firstName;
    public static volatile SingularAttribute<Employees, String> extension;
    public static volatile ListAttribute<Employees, Employees> employeesList;
    public static volatile SingularAttribute<Employees, String> jobTitle;
    public static volatile SingularAttribute<Employees, Offices> officeCode;
    public static volatile SingularAttribute<Employees, Employees> reportsTo;
    public static volatile SingularAttribute<Employees, String> email;
    public static volatile SingularAttribute<Employees, Integer> employeeNumber;

}