package com.hsbc.hktools.service;

import java.util.List;

import com.hsbc.hktools.entity.Contacts;

public interface ContactsService {
	public Contacts getContactsById(int contactsId);
	
    public void insertContact(Contacts contact);
    
    public List<Contacts> getAllContacts();
    
    public List<Contacts> getContactsByLimit(int startPos, int pageSize);
    
	public int getContactsCount();
	
	public List<Contacts> getWarningContacts();
	
	public void updateContact(Contacts contact);
	
	public void deleteContact(int contactId);
	
	public List<Contacts> getDayContactListByNameAndGroupId(String name, int groupId);

	public List<Contacts> getDayContactListByGroupId(int groupId);

	public List<Contacts> getDayContactListByName(String name);
}
