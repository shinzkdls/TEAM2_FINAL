package com.kbstar.dto;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class TableInfo {
    private String column_name;
    private String data_type;
    private int data_length;
}
