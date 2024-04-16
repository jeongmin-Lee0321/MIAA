package com.tech.miaa.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.tech.miaa.dto.AnimalDto;

public interface MissingAnimalDao {
	public void animalWrite(String tel,String openclose, String missingday,String address,String animalname,
			String animalkind1,String animalkind2,String sexCd,String colorCd,String age,String sepcialMark,
			String userId,String addresscode1, String addresscode2);
	public void imgUpLoad(String userId, int i, String animalname, String fileName, String animalkind2);
	public ArrayList<AnimalDto> animalListView(int rowStart, int rowEnd);
	public int totalCount();
	
}
