package apptest.service;

import apptest.entity.Part;

import java.util.List;

public interface PartService {
    int createPart(Part part);
    Part updatePart(Part part);
    void deletePart(int id);
    List<Part> getAllParts();
    List<Part> getAllParts(String partName);
    Part getPart(int id);
    List<Part> getRequired(String isRequired);
    int computers();
}
