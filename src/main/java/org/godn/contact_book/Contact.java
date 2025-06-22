package org.godn.contact_book;

public class Contact {
    private String name;
    private String email;
    private long number;

    public Contact(String name, String email, long number) {
        this.name = name;
        this.email = email;
        this.number = number;
    }
    // Getters and setters...
    public String getContactName() { return name; }
    public String getEmail() { return email; }
    public long getNumber() { return number; }
    public void setContactName(String name) { this.name = name; }
    public void setEmail(String email) { this.email = email; }
    public void setNumber(long number) { this.number = number; }
}