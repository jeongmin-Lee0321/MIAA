package com.tech.miaa.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class matchingAlarmListDto {
   private ItemDto item_dto;
   private AnimalDto animal_dto;
   private int total_id;
}