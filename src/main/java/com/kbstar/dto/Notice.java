package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Notice {
    private Integer noticepin;
    private Integer adminpin;
    private String noticetitle;
    private String noticecontent;
    private Date noticedate;

    public Notice(Integer adminpin, String noticetitle, String noticecontent) {
        this.adminpin = adminpin;
        this.noticetitle = noticetitle;
        this.noticecontent = noticecontent;
    }
}
