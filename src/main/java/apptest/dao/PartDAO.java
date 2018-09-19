package apptest.dao;

import apptest.entity.Part;

import java.util.List;

public interface PartDAO {
    int createPart(Part part);
    Part updatePart(Part part);
    void deletePart(int id);
    List<Part> getAllParts();
    List<Part> getAllParts(String partName);
    Part getPart(int id);
    List<Part> getRequired(String isRequired);
    int computers();
}