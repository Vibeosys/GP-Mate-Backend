package ar.com.lodev.medical_manager.model.dto;

import ar.com.lodev.medical_manager.model.Patient;

public class PatientDTO extends BaseEntityDTO{
	
	private String name;
	private String lastname;
	private Long dateOfBirth;
	private String email;
	
	public PatientDTO(Patient patient){
		super(patient);
		this.name = patient.getName();
		this.lastname = patient.getLastname();
		if(patient.getDateOfBirth() != null){
			this.dateOfBirth = patient.getDateOfBirth().getTime();
		}
		this.email = patient.getEmail();
	}
	
	

	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}



	public Long getDateOfBirth() {
		return dateOfBirth;
	}



	public void setDateOfBirth(Long dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	

}
