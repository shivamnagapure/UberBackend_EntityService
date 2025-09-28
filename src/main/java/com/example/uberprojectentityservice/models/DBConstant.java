package com.example.uberprojectentityservice.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.*;

@Entity
@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "db_constant")
public class DBConstant extends BaseModel{

    @Column(unique = true, nullable = false)
    private String name;

    private String value;
}
