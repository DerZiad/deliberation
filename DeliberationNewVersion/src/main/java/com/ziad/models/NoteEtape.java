package com.ziad.models;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ziad.enums.DeliberationType;
import com.ziad.enums.Etat;
import com.ziad.enums.TypeNote;
import com.ziad.models.compositeid.ComposedNoteEtape;

@Entity
@Table(name = "notesetape")
public class NoteEtape implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private ComposedNoteEtape idCompose;

	private Double note = 0d;

	private String etat = "";

	private boolean isValid = false;

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	private Deliberation deliberation;

	public NoteEtape() {

	}

	public NoteEtape(Double note, Deliberation deliberation) {
		super();
		this.note = arrondir(note);
		this.deliberation = deliberation;
	}

	public NoteEtape(ComposedNoteEtape idCompose, Double note, Deliberation deliberation) {
		this(note, deliberation);
		this.idCompose = idCompose;
	}

	public ComposedNoteEtape getIdCompose() {
		return idCompose;
	}

	public void setIdCompose(ComposedNoteEtape idCompose) {
		this.idCompose = idCompose;
	}

	public Double getNote() {
		return arrondir(note);
	}

	public void setNote(Double note) {
		this.note = arrondir(note);
	}

	public boolean isValid() {
		return isValid;
	}

	public void setValid(boolean isValid) {
		this.isValid = isValid;
	}

	public Deliberation getDeliberation() {
		return deliberation;
	}

	public void setDeliberation(Deliberation deliberation) {
		this.deliberation = deliberation;
	}

	public String getEtat() {
		return etat;
	}

	public void setEtat(String etat) {
		this.etat = etat;
	}

	public void delibererEtape() {
		if (note >= idCompose.getEtape().getValidation()) {
			etat = Etat.VALIDE.name();
			isValid = true;
		}else
			etat = Etat.ELIMINIE.name();
	}
	
	public double arrondir(Double note) {
		return Math.round(note * 100.0)/100.0;
	}
	
}
