package com.kbstar.dto;

import lombok.*;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cust {
    @Size(min=4, max=10, message= "ID는 최소 4자리 이상 10자리 이하")
    @NotEmpty(message = "ID는 필수항목입니다.")
    private String id;
    @Size(min=5, max=10, message= "PassWord는 최소 4자리 이상 10자리 이하")
    @NotEmpty(message = "PassWord는 필수항목입니다.")
    private String pwd;
    @NotEmpty(message = "NAME은 필수항목입니다.")
    private String name;
}
