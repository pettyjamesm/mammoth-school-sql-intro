
CREATE TABLE base_items (
    id integer primary key,
    name varchar not null
);

CREATE TABLE associations (
    id integer primary key,
    base_item_id integer not null,
    value integer not null,
    FOREIGN KEY (base_item_id) REFERENCES base_items(id)
);

CREATE INDEX "associations_base_item_id_fk" ON associations (base_item_id);

INSERT INTO base_items (id, name) VALUES (1, 'one'), (2, 'two'), (3, 'environment ok');

INSERT INTO associations (base_item_id, value) VALUES (1, 1), (2, 1), (2, 1), (3, 1), (3, 1), (3, 1);

SELECT name || ': ' ||  case SUM(value) when 3 then 'YES' else 'FAILURE' end
FROM 
    base_items JOIN associations 
        ON base_items.id = associations.base_item_id
WHERE
    base_items.name = 'environment ok'
GROUP BY base_item_id;

DROP TABLE associations;

DROP TABLE base_items;
