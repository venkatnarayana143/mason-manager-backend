package com.mason.manager.service;

import com.mason.manager.entity.Payment;
import com.mason.manager.repository.PaymentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaymentService {

    @Autowired
    private PaymentRepository paymentRepository;

    public List<Payment> getAllPayments() {
        return paymentRepository.findAll();
    }

    public List<Payment> getPaymentsByEmployee(Long employeeId) {
        return paymentRepository.findByEmployeeId(employeeId);
    }

    public Payment recordPayment(Payment payment) {
        return paymentRepository.save(payment);
    }
}
