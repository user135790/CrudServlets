package edu.unicauca.apiweb.crudservlets.persistence.entities;

import edu.unicauca.apiweb.crudservlets.persistence.entities.Employees;
import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2023-12-05T21:55:50")
@StaticMetamodel(Offices.class)
public class Offices_ { 

    public static volatile SingularAttribute<Offices, String> country;
    public static volatile ListAttribute<Offices, Employees> employeesList;
    public static volatile SingularAttribute<Offices, String> city;
    public static volatile SingularAttribute<Offices, String> phone;
    public static volatile SingularAttribute<Offices, String> postalCode;
    public static volatile SingularAttribute<Offices, String> officeCode;
    public static volatile SingularAttribute<Offices, String> addressLine1;
    public static volatile SingularAttribute<Offices, String> addressLine2;
    public static volatile SingularAttribute<Offices, String> state;
    public static volatile SingularAttribute<Offices, String> territory;

}