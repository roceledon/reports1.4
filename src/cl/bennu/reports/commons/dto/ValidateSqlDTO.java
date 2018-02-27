package cl.bennu.reports.commons.dto;

import java.io.Serializable;

public class ValidateSqlDTO implements Serializable {
    private Boolean validate;
    String forbiddenWord;

    public Boolean getValidate() {
        return validate;
    }

    public void setValidate(Boolean validate) {
        this.validate = validate;
    }

    public String getForbiddenWord() {
        return forbiddenWord;
    }

    public void setForbiddenWord(String forbiddenWord) {
        this.forbiddenWord = forbiddenWord;
    }
}
