from sqlalchemy import (
    Column,
    Index,
    Integer,
    Date,
    Numeric,
    )

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import (
    scoped_session,
    sessionmaker,
    )

from zope.sqlalchemy import ZopeTransactionExtension

from datetime import date

DBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
Base = declarative_base()

class Weight(Base):
    __tablename__ = 'weights'

    id = Column(Integer, primary_key=True)
    date = Column(Date, default=date.today)
    weight = Column(Numeric(8, 1))

    @classmethod
    def get_latest(cls, num):
        return list(reversed(DBSession.query(cls).order_by(-cls.date).limit(num).all()))

Index('idx_date', Weight.date)
