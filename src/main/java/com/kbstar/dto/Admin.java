package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Admin {
    private int adminPin;
    private String adminId;
    private String adminName;
    private String password;
    private String createdate;
}
