package com.example.uberprojectentityservice.models;


import jakarta.persistence.*;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.List;

@Entity
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class Driver extends BaseModel {

    private String name ;

    @Column(nullable = false , unique = true)
    private String licenseNumber ;

    private String phoneNumber ;

    private String aadharCard;

    @OneToOne(mappedBy = "driver" , cascade = CascadeType.ALL)
    private Car car;

    @Enumerated(value = EnumType.STRING)
    private DriverApprovalStatus driverApprovalStatus ;

    @OneToOne
    private ExactLocation lastKnownLocation;

    @OneToOne
    private ExactLocation homeLocation;

    private String activeCity;

    private String isAvailable ;

    @DecimalMin(value = "0.00", message = "Rating must be grater than or equal to 0.00")
    @DecimalMax(value = "5.00", message = "Rating must be less than or equal to 5.00")
    private Double rating;


    /*
            The driver_id column in booking table creates the link.
            When Hibernate loads a Driver, it looks in the booking table for rows where driver_id = driver.id, and fills the bookings list.
            When you set booking.setDriver(driver) in code, Hibernate stores the driver’s ID in the booking.driver_id column.
     */
    @OneToMany(mappedBy = "driver" )
    @Fetch(FetchMode.SUBSELECT)
    private List<Booking> bookings ;

}

