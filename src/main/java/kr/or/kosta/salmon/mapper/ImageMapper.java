package kr.or.kosta.salmon.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * ImageMapper
 */
public interface ImageMapper {

    public int registProfileImage(@Param("path") String path, @Param("userId") String userId) throws Exception;
}