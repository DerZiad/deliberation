package com.ziad.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.ziad.enums.Etat;
import com.ziad.models.compositeid.ComposedNoteSemestre;

@Entity
@Table(name = "notessemestre")
public class NoteSemestre implements Comparable<NoteSemestre>, NoteNorm {
	@EmbeddedId
	private ComposedNoteSemestre idCompose;

	private Double note = 0d;
	private boolean isValid = false;

	private String etat = "";// Compensation ou elimine

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	private AnneeAcademique anneeAcademique;

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH })
	private Deliberation deliberation;

	public NoteSemestre() {

	}

	public NoteSemestre(ComposedNoteSemestre idCompose, Double note, Deliberation deliberation, AnneeAcademique annee) {
		this(note, deliberation, annee);
		this.idCompose = idCompose;

	}

	public NoteSemestre(Double note, Deliberation deliberation, AnneeAcademique annee) {
		super();
		this.note = arrondir(note);
		this.deliberation = deliberation;
		this.anneeAcademique = annee;
	}

	public ComposedNoteSemestre getIdCompose() {
		return idCompose;
	}

	public void setIdCompose(ComposedNoteSemestre idCompose) {
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

	public void delibererSemestre(List<NoteModule> notesModule) {
		boolean moduleValides = true;
		for (NoteModule note : notesModule) {
			moduleValides = moduleValides && note.isValid();
		}

		if (note >= idCompose.getSemestre().getValidation() && moduleValides) {
			etat = Etat.VALIDE.name();
		} else {
			boolean validByCompensation = true;
			for (NoteModule noteModule : notesModule) {
				Modulee module = noteModule.getIdComposed().getModule();
				validByCompensation = validByCompensation && noteModule.getNote() > module.getEliminatoire();
			}
			if (validByCompensation) {
				etat = Etat.COMPONSE.name();
				isValid = true;
			} else {
				etat = Etat.NONVALID.name();
			}
		}

	}

	public AnneeAcademique getAnneeAcademique() {
		return anneeAcademique;
	}

	public void setAnneeAcademique(AnneeAcademique anneeAcademique) {
		this.anneeAcademique = anneeAcademique;
	}

	@Override
	public String toString() {
		return "NoteSemestre [idCompose=" + idCompose + ", note=" + note + ", isValid=" + isValid + ", etat=" + etat
				+ ", deliberation=" + deliberation + "]";
	}

	@Override
	public int compareTo(NoteSemestre o) {
		if (getNote() > o.getNote())
			return 1;
		else if (getNote() < o.getNote())
			return -1;
		else
			return 0;
	}

	public double arrondir(Double note) {
		return Math.round(note * 100.0) / 100.0;
	}

	@Override
	public void calculState() {
		if (note >= idCompose.getSemestre().getValidation()) {
			etat = Etat.VALIDE.name();
		} else {
			etat = Etat.NONVALID.name();
		}

	}

	@Override
	public ElementNorm getElement() {
		return idCompose.getSemestre();
	}

	@Override
	public Etudiant getEtudiant() {
		return idCompose.getEtudiant();
	}

	@Override
	public Long getIdStudent() {
		return idCompose.getEtudiant().getId_etudiant();
	}

	@Override
	public Double getValidation() {
		return idCompose.getSemestre().getValidation();
	}

}
