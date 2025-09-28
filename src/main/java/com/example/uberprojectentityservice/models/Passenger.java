package com.example.uberprojectentityservice.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Entity
@Getter
@Setter
public class Passenger extends BaseModel{

    private String name ;

    @Column(nullable = false)
    private String email ;

    @Column(nullable = false)
    private String password; // encrypted password

    @Column(nullable = false)
    private String phoneNumber;

    @OneToMany(mappedBy = "passenger" )
    private List<Booking> bookings ; // 1 : m relationship

    @OneToOne
    private Booking activeBooking;

    @DecimalMin(value = "0.00", message = "Rating must be grater than or equal to 0.00")
    @DecimalMax(value = "5.00", message = "Rating must be less than or equal to 5.00")
    private Double rating;

    @OneToOne
    private ExactLocation lastKnownLocation;

    @OneToOne
    private ExactLocation homeLocation;
}