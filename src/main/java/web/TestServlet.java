package web;

import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;
import model.dao.UserDAO;
import model.pojo.GenerateQRCode;
import model.pojo.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "TestServlet", value = "/TestServlet")
public class TestServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {





        /*
        GenerateQRCode generateqrcode = new GenerateQRCode();

        String str= "THE HABIT OF PERSISTENCE IS THE HABIT OF VICTORY.";
//path where we want to get QR Code
        String path = "C:\\Users\\Miatt\\Desktop\\Faseyha Parking\\src\\main\\webapp\\img\\qrcode.png";
//Encoding charset to be used
        String charset = "UTF-8";
        Map<EncodeHintType, ErrorCorrectionLevel> hashMap = new HashMap<EncodeHintType, ErrorCorrectionLevel>();
//generates QR code with Low level(L) error correction capability
        hashMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
//invoking the user-defined method that creates the QR code
        try {
            generateqrcode.generateQRcode(str, path, charset, hashMap, 200, 200);//increase or decrease height and width accodingly
            response.getWriter().print("ok not");
        } catch (WriterException e) {
            e.printStackTrace();
        }


         */











    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] parkingSpotNumber = request.getParameterValues("parkingspot");


        response.getWriter().print(parkingSpotNumber[0]);
    }
}
