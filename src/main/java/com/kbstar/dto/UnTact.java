package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class UnTact {
    private int contactpin;
    private String contactdate;
    private String contacttitle;
    private String contactcontent;
    private int custpin;
    private int days_elapsed;
}
