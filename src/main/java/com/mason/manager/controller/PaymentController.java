package com.mason.manager.controller;

import com.mason.manager.entity.Payment;
import com.mason.manager.service.PaymentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/payments")
@CrossOrigin(origins = "http://localhost:5173")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @GetMapping
    public List<Payment> getAllPayments() {
        return paymentService.getAllPayments();
    }

    @GetMapping("/employee/{employeeId}")
    public List<Payment> getPaymentsByEmployee(@PathVariable Long employeeId) {
        return paymentService.getPaymentsByEmployee(employeeId);
    }

    @PostMapping
    public Payment recordPayment(@RequestBody Payment payment) {
        return paymentService.recordPayment(payment);
    }
}
