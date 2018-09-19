package apptest.dao;

import apptest.entity.Part;
import apptest.repository.PartRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class PartDAOImpl implements PartDAO {

    private final PartRepository partRepository;

    @Autowired
    public PartDAOImpl(PartRepository partRepository) {
        this.partRepository = partRepository;
    }

    @Override
    public int createPart(Part part) {
        return (int) partRepository.create(part);
    }

    @Override
    public Part updatePart(Part part) {
        return partRepository.update(part);
    }

    @Override
    public void deletePart(int id) {
        Part part = new Part();
        part.setId(id);
        partRepository.delete(part);
    }

    @Override
    public List<Part> getAllParts() {
        return partRepository.fetchAll(Part.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Part> getAllParts(String partName) {
        String query = "SELECT t.* FROM part t WHERE t.name like '%" + partName + "%'";
        List<Object[]> partObjects = partRepository.fetchAll(query);
        List<Part> parts = new ArrayList<>();
        CreateList(partObjects, parts);
        return parts;
    }

    private void CreateList(List<Object[]> partObjects, List<Part> parts) {
        for (Object[] partObject : partObjects) {
            Part part = new Part();
            int id = (int) partObject[0];
            String name = (String) partObject[1];
            boolean required = (boolean) partObject[2];
            int amount = (int) partObject[3];
            part.setId(id);
            part.setName(name);
            part.setRequired(required);
            part.setAmount(amount);
            parts.add(part);
        }
    }

    @Override
    public Part getPart(int id) {
        return partRepository.fetchById(id, Part.class);
    }

    @SuppressWarnings("unchecked")
    @Override
    public List<Part> getRequired(String isRequired) {
        if (isRequired.isEmpty()) return getAllParts();
        else {
            String query = "SELECT t.* FROM part t WHERE t.required = " + isRequired;
            List<Object[]> partObjects = partRepository.fetchAll(query);
            List<Part> parts = new ArrayList<>();
            CreateList(partObjects, parts);
            return parts;
        }
    }

    @Override
    public int computers() {
        List<Part> required = getRequired("true");
        TreeSet<Integer> set = new TreeSet<>();
        for (Part part : required) {
            set.add(part.getAmount());
        }
        if (set.isEmpty()) return 0;
        return set.first();
    }
}
