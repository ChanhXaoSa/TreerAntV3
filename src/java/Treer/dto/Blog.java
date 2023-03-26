/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Treer.dto;

/**
 *
 * @author tuank
 */
public class Blog {

    private int blogID;
    private int status;
    private String Title;
    private String description;
    private String postdate;
    private String imgpath;
    private String link;

    public Blog() {
    }

    public Blog(int blogID, int status, String Title, String description, String postdate, String imgpath, String link) {
        this.blogID = blogID;
        this.status = status;
        this.Title = Title;
        this.description = description;
        this.postdate = postdate;
        this.imgpath = imgpath;
        this.link = link;
    }

    public int getStatus() {
        return status;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPostdate() {
        return postdate;
    }

    public void setPostdate(String postdate) {
        this.postdate = postdate;
    }

    public String getImgpath() {
        return imgpath;
    }

    public void setImgpath(String imgpath) {
        this.imgpath = imgpath;
    }

    @Override
    public String toString() {
        return "Blog{" + "blogID=" + blogID + ", status=" + status + ", Title=" + Title + ", description=" + description + ", postdate=" + postdate + ", imgpath=" + imgpath + ", link=" + link + '}';
    }
}
