package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class EmpDTO {
    private String name;
    private String position;
    private String office;
    private int age;
    private Date sdate;
    private int salary;
}
