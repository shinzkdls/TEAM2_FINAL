package com.kbstar.mapper;

import com.kbstar.dto.Chart3;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
@Mapper
public interface Chart3Mapper {
    List<Chart3> getTypeTotalPayment();
}
