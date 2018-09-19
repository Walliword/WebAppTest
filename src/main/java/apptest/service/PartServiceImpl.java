package apptest.service;

import apptest.dao.PartDAO;
import apptest.entity.Part;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class PartServiceImpl implements PartService {

    @Autowired
    public PartServiceImpl(PartDAO partDAO) {
        this.partDAO = partDAO;
    }

    private final PartDAO partDAO;

    @Override
    public int createPart(Part part) {
        return partDAO.createPart(part);
    }

    @Override
    public Part updatePart(Part part) {
        return partDAO.updatePart(part);
    }

    @Override
    public void deletePart(int id) {
        partDAO.deletePart(id);
    }

    @Override
    public List<Part> getAllParts() {
        return partDAO.getAllParts();
    }

    @Override
    public List<Part> getAllParts(String partName) {
        return partDAO.getAllParts(partName);
    }

    @Override
    public Part getPart(int id) {
        return partDAO.getPart(id);
    }

    @Override
    public List<Part> getRequired(String isRequired) {
        return partDAO.getRequired(isRequired);
    }

    @Override
    public int computers() {
        return partDAO.computers();
    }
}
