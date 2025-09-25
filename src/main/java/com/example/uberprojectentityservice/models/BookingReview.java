package com.example.uberprojectentityservice.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/*
    @Entity : 1. tell JPA provider (Hibernate) to map class in database as table.
              2. All fields mapped to column of DataBase by default ;
    @Table : use to provides extra information about table

    JPA/Hibernate uses reflection and requires a no-arg constructor to instantiate entities before setting fields.
    If you don’t define any constructor in the class, Java provides one automatically.
    But if you define any other constructor (like @AllArgsConstructor),
    Java does not generate a default one → that’s when @NoArgsConstructor becomes necessary.

    @AllArgsConstructor : to create obj of builder constructor with all fields needed
    @NoArgsConstructor : if any other constructor is created then ,we must have to create no argument constructor
 */

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "booking_review" ,
        uniqueConstraints = {@UniqueConstraint(columnNames = {"id" , "booking_id"})})
@Inheritance(strategy = InheritanceType.JOINED) // Defines how JPA maps an inheritance hierarchy into DB tables.
public class BookingReview extends BaseModel {

    //cascade decides how operations applied on one entity should be propagated/affected to related entities .
    @OneToOne(cascade = {CascadeType.PERSIST , CascadeType.REMOVE} , fetch = FetchType.LAZY)
    private Booking booking ;

    @Column(nullable = false) //Ensures that the column must always have a value when inserting or updating a record.
    private String content ;

    @Column(nullable = false)
    private Double rating ;

}
