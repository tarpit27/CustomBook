package com.arpit.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author megha
 */
public class UploadProfile extends HttpServlet {

    private boolean isMultipart;
    private String filePath;
    private int maxFileSize = 10000000 * 1024;
    private int maxMemSize = 10000000 * 1024;
    private File file;

    public void init() {
        // Get the file location where it would be stored.
        filePath = "C:\\Users\\arpit\\Documents\\NetBeansProjects\\CustomFacebook\\web\\Uploads\\PicProfile\\";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        // Check that we have a file upload request
        isMultipart = ServletFileUpload.isMultipartContent(request);
        response.setContentType("text/html");
        java.io.PrintWriter out = response.getWriter();
        if (!isMultipart) {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>No file uploaded</p>");
            out.println("</body>");
            out.println("</html>");
            return;
        }
        System.out.println("Checkpoint 1");
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // Location to save data that is larger than maxMemSize.
        factory.setRepository(new File("c:\\temp"));

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        try {
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();

            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            System.out.println("Checkpoint 2");
            while (i.hasNext()) {
                FileItem fi = (FileItem) i.next();
                System.out.println("Checkpoint 3: isFormField: " + fi.isFormField());
                if (!fi.isFormField()) {
                    System.out.println("Checkpoint 4");
                    // Get the uploaded file parameters
                    String fieldName = fi.getFieldName();
                    System.out.println("FieldName: " + fieldName);
                    String fileName = fi.getName();
                    System.out.println(fi.getName());
                    String contentType = fi.getContentType();
                    System.out.println(contentType);
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();
                    System.out.println(filePath);
                    // Write the file
                    String name = filePath + session.getAttribute("userId") + ".jpg";
                    file = new File(name);
                    fi.write(file);
                    response.sendRedirect("home.jsp");
                }
            }
            out.println("</body>");
            out.println("</html>");
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
}
