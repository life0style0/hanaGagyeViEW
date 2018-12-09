package kr.or.kosta.salmon.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.kosta.salmon.mapper.ImageMapper;

/**
 * ImageServiceImpl
 */
@Service
public class ImageServiceImpl implements ImageService {

    @Inject
    private ImageMapper im;

    @Override
    public boolean registProfileImage(String path, String userId) throws Exception {
        return im.registProfileImage(path, userId) > 0 ? true : false;
    }

}