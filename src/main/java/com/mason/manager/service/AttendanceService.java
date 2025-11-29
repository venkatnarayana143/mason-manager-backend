package com.mason.manager.service;

import com.mason.manager.entity.Attendance;
import com.mason.manager.repository.AttendanceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class AttendanceService {

    @Autowired
    private AttendanceRepository attendanceRepository;

    public List<Attendance> getAllAttendance() {
        return attendanceRepository.findAll();
    }

    public List<Attendance> getAttendanceByDate(LocalDate date) {
        return attendanceRepository.findByDate(date);
    }

    public List<Attendance> getAttendanceByEmployeeId(Long employeeId) {
        return attendanceRepository.findByEmployeeId(employeeId);
    }

    public Attendance markAttendance(Attendance attendance) {
        Attendance existing = attendanceRepository.findByEmployeeIdAndDate(
                attendance.getEmployee().getId(),
                attendance.getDate());

        if (existing != null) {
            existing.setStatus(attendance.getStatus());
            return attendanceRepository.save(existing);
        }

        return attendanceRepository.save(attendance);
    }
}
